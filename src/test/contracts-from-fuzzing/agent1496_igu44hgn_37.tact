struct Inner { 
    val: Int?; 
}

struct Mid { 
    inner: Inner?; 
}

contract DocEdge {
    pstate: Mid?;
    init() {
        self.pstate = Mid{
            inner: null
        };
    }
}