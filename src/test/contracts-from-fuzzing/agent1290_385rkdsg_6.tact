struct Mid {
    inner: Int; 
    text: String; 
    opt: String?; 
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
    mid3: Mid;
}

contract TestContract {
    payload: Outer;

    init() {
        self.payload = Outer{
            mid1: Mid{ inner: 1, text: "a", opt: null },
            mid2: Mid{ inner: 2, text: "b", opt: null },
            mid3: Mid{ inner: 3, text: "c", opt: null }
        };
    }

    receive() {
        self.payload = Outer{
            mid1: Mid{ inner: 10, text: "aa", opt: "x" },
            mid2: Mid{ inner: 20, text: "bb", opt: "y" },
            mid3: Mid{ inner: 30, text: "cc", opt: "z" }
        };
    }
}