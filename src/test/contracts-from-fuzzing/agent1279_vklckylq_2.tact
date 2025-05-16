struct Deep1 { a: Int }
struct Deep2 { d2: Deep1 }
struct Deep3 { d3: Deep2 }
struct Deep4 { d4: Deep3 }
struct Deep5 { d5: Deep4 }

contract DeepContract {
    val: Deep5;

    init() {
        self.val = Deep5{ d5: Deep4{ d4: Deep3{ d3: Deep2{ d2: Deep1{ a: 123 }}}}};
    }
}