struct S1 { f: Int; }
struct S2 { s: S1?; }
struct S3 { s: S2; }
struct S4 { s: S3; }
struct S5 { s: S4; }
struct S6 { s: S5; }
struct S7 { s: S6; }
struct S8 { s: S7; mapField: map<Int, S1>; }

contract DeepOptionalMapTest {
    receive() {
        let m: map<Int, S1> = emptyMap();
        m.set(1, S1{ f: 10 });
        let s8: S8 = S8{ s: S7{ s: S6{ s: S5{ s: S4{ s: S3{ s: S2{ s: S1{ f: 42 } } } } } } }, mapField: m };
    }
}
