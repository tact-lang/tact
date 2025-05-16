struct Deep1 { val: Int }
struct Deep2 { val: Deep1 }
struct Deep3 { val: Deep2 }
struct Deep4 { val: Deep3 }
struct Deep5 { val: Deep4 }

contract DeepNest {
    f: Deep5;

    init() {
        self.f = Deep5{ val: Deep4{ val: Deep3{ val: Deep2{ val: Deep1{ val: 7 }}}}};
    }
}