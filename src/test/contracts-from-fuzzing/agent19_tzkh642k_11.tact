// Fuzz testing deeply nested and large structs

// 1. Big flat struct with many fields
struct BigFlat {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Int;
    f12: Int;
    f13: Int;
    f14: Int;
    f15: Int;
    f16: Int;
    f17: Int;
    f18: Int;
    f19: Int;
    f20: Int;
}

contract TestBigFlat {
    receive() {
        let a: BigFlat = BigFlat{
            f1: 1,  f2: 2,  f3: 3,  f4: 4,  f5: 5,
            f6: 6,  f7: 7,  f8: 8,  f9: 9,  f10: 10,
            f11: 11, f12: 12, f13: 13, f14: 14, f15: 15,
            f16: 16, f17: 17, f18: 18, f19: 19, f20: 20
        };
    }
}

// 2. Nested struct: simple nesting
struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer{
            inner: Inner{ x: 123 },
            y: 456
        };
    }
}

// 3. Deep chain of nested structs
struct L6 { val: Int; }
struct L5 { l6: L6; }
struct L4 { l5: L5; }
struct L3 { l4: L4; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract TestDeepChain {
    receive() {
        let d: L1 = L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        l5: L5{
                            l6: L6{ val: 42 }
                        }
                    }
                }
            }
        };
    }
}

// 4. Struct with optional and map fields
struct InnerOpt {
    a: Int;
}

struct OuterOpt {
    opt: InnerOpt?;
    m: map<Int, Int>;
}

contract TestOptionalMap {
    receive() {
        let o: OuterOpt = OuterOpt{
            opt: InnerOpt{ a: 42 },
            m: emptyMap()
        };
    }
}

// 5. Deeply nested struct mixing optional and map fields
struct L4D {
    a: Int;
}

struct L3D {
    l4: L4D?;
}

struct L2D {
    l3: L3D;
}

struct L1D {
    l2: L2D;
    m: map<Int, Int>;
}

contract TestDeepOptionalMap {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        let s: L1D = L1D{
            l2: L2D{
                l3: L3D{
                    l4: null
                }
            },
            m: m
        };
    }
}

// 6. Mixed nested struct with non-optional and optional sub-struct and map
struct DeepNested {
    b: Int;
}

struct DeepOpt {
    c: Int;
}

struct DeepMixed {
    a: Int;
    nested: DeepNested;
    m: map<Int, Bool>;
    opt: DeepOpt?;
}

contract TestDeepMixed {
    receive() {
        let myMap: map<Int, Bool> = emptyMap();
        myMap.set(1, true);
        myMap.set(2, false);

        let dm: DeepMixed = DeepMixed{
            a: 777,
            nested: DeepNested{ b: 888 },
            m: myMap,
            opt: DeepOpt{ c: 999 }
        };
    }
}
