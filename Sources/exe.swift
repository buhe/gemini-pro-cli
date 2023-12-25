// The Swift Programming Language
// https://docs.swift.org/swift-book
import LangChain
import Foundation

@main
struct Execute {
    static func main() async throws {
        if let myEnvVar = ProcessInfo.processInfo.environment["GOOGLEAI_API_KEY"] {
            print("The value of GOOGLEAI_API_KEY is \(myEnvVar)")
            Env.initSet(["GOOGLEAI_API_KEY": myEnvVar])
        } else {
            print("MY_ENV_VAR is not set")
        }
        
        let llm = Gemini()
        let r = await llm.generate(text: "hi")
        print("Hello, world!! \(r!.llm_output!)")
    }
}
