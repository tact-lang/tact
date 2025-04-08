struct SOne { a: Int }
struct STwo { b: Int }
struct SThree { c: Int }
struct SFour { d: Int }
struct SFive { e: Int }
struct SSix { f: Int }

struct AllStructs {
    s1: SOne;
    s2: STwo;
    s3: SThree;
    s4: SFour;
    s5: SFive;
    s6: SSix;
}

contract MultipleStructsContract {
    combined: AllStructs;

    init() {
        self.combined = AllStructs{
            s1: SOne{ a:1 },
            s2: STwo{ b:2 },
            s3: SThree{ c:3 },
            s4: SFour{ d:4 },
            s5: SFive{ e:5 },
            s6: SSix{ f:6 }
        };
    }
}