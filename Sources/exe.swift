// The Swift Programming Language
// https://docs.swift.org/swift-book
import LangChain
@main
struct Execute {
    static func main() async throws {
        let llm = Gemini()
        let r = await llm.generate(text: "hi")
        print("Hello, world!! \(r!.llm_output!)")
    }
}
