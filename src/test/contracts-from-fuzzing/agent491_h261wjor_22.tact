struct Wrap1 { inner1: Int; } 
struct Wrap2 { inner2: Wrap1; } 
struct Wrap3 { inner3: Wrap2; } 
struct Wrap4 { inner4: Wrap3; } 
struct Wrap5 { inner5: Wrap4; } 

contract WrappedMany {
    state: Wrap5;
    init() {
        self.state = Wrap5{ inner5: Wrap4{ inner4: Wrap3{ inner3: Wrap2{ inner2: Wrap1{ inner1: 321 } } } } };
    }
}