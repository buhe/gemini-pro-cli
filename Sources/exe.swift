// The Swift Programming Language
// https://docs.swift.org/swift-book
import LangChain
import Foundation

@main
struct Execute {
    static func main() async throws {
        if let myEnvVar = ProcessInfo.processInfo.environment["GOOGLEAI_API_KEY"] {
//            print("The value of GOOGLEAI_API_KEY is \(myEnvVar)")
            Env.initSet(["GOOGLEAI_API_KEY": myEnvVar])
        } else {
            print("GOOGLEAI_API_KEY is not set")
        }
        let arguments = CommandLine.arguments
        var prompt = ""
        for (index, argument) in arguments.enumerated() {
            if index > 1 {
//                print("Argument \(index): \(argument)")
                prompt = "\(prompt) \(argument)"
            }
            if index == 1 {
                prompt = argument
            }
        }
//        print(prompt)
        let llm = Gemini()
        let r = await llm.generate(text: prompt)
        print("🎄\(r!.llm_output!)")
    }
}
