import LangChain
import Foundation

@main
struct Execute {
    static let GKEY = "GOOGLEAI_API_KEY"
    static func main() async throws {
        if let myEnvVar = ProcessInfo.processInfo.environment[GKEY] {
            Env.initSet([GKEY: myEnvVar])
        } else {
            print("\(GKEY) is not set")
        }
        let arguments = CommandLine.arguments
        var prompt = ""
        for (index, argument) in arguments.enumerated() {
            if index > 1 {
                prompt = "\(prompt) \(argument)"
            }
            if index == 1 {
                prompt = argument
            }
        }
        let llm = Gemini()
        let r = await llm.generate(text: prompt)
        print("🎄\(r!.llm_output!)")
    }
}
