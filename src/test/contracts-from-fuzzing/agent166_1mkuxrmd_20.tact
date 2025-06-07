message(1) M1 { x: Int; }
message(2) M2 { y: Int; }
message(3) M3 { z: Int; }

struct BigStruct {
    m1: M1?;
    m2: M2?;
    m3: M3?;
}

contract TestContract {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            m1: null,
            m2: M2{ y: 2 },
            m3: null,
        };
    }
}