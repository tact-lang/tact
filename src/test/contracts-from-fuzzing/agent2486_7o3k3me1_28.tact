struct Inner { flag: Bool; text: String }

struct Outer { data: Inner; count: Int }

contract DeepInstance {
    outer: Outer = Outer{ data: Inner{ flag: true, text: "hi" }, count: 42 };
}