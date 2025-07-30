struct Wrap1 { f1: Int }
struct Wrap2 { s: Wrap1 }
struct Wrap3 { s: Wrap2 }
struct Wrap4 { s: Wrap3 }
struct Wrap5 { s: Wrap4 }
struct Wrap6 { s: Wrap5 }
struct Wrap7 { s: Wrap6 }

contract DeepWrapper {
    deep: Wrap7;
    init() {
        self.deep = Wrap7{ s: Wrap6{ s: Wrap5{ s: Wrap4{ s: Wrap3{ s: Wrap2{ s: Wrap1{ f1: 100 } } } } } } };
    }
}