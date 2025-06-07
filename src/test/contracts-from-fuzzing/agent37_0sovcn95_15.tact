///////////////////////////////////////////////////////////////////////
// Test 1: Long Flat Struct (20 fields)
///////////////////////////////////////////////////////////////////////
struct LongFlat {
    f0: Int;
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
    f19: Int
}

contract TestFlat {
    receive() {
        let s: LongFlat = LongFlat{
            f0: 0,
            f1: 1,
            f2: 2,
            f3: 3,
            f4: 4,
            f5: 5,
            f6: 6,
            f7: 7,
            f8: 8,
            f9: 9,
            f10: 10,
            f11: 11,
            f12: 12,
            f13: 13,
            f14: 14,
            f15: 15,
            f16: 16,
            f17: 17,
            f18: 18,
            f19: 19
        };
        // Access the last field to ensure full compilation
        dump(s.f19);
    }
}

///////////////////////////////////////////////////////////////////////
// Test 2: Nested Structs
///////////////////////////////////////////////////////////////////////
struct Inner {
    a: Int
}

struct Outer {
    inner: Inner;
    b: Int
}

contract TestNested {
    receive() {
        let o: Outer = Outer {
            inner: Inner { a: 42 },
            b: 100
        };
        dump(o.inner.a + o.b); // Expected: 142
    }
}

///////////////////////////////////////////////////////////////////////
// Test 3: Deep Chains of Nested Structs
///////////////////////////////////////////////////////////////////////
struct L5 {
    value: Int
}

struct L4 {
    l5: L5
}

struct L3 {
    l4: L4
}

struct L2 {
    l3: L3
}

struct L1 {
    l2: L2
}

contract TestDeepChain {
    receive() {
        let x: L1 = L1 {
            l2: L2 {
                l3: L3 {
                    l4: L4 {
                        l5: L5 { value: 999 }
                    }
                }
            }
        };
        dump(x.l2.l3.l4.l5.value); // Expected: 999
    }
}

///////////////////////////////////////////////////////////////////////
// Test 4: Optional Nested Structs
///////////////////////////////////////////////////////////////////////
struct InnerOpt {
    a: Int?
}

struct OuterOpt {
    inner: InnerOpt;
}

contract TestOptionalNested {
    receive() {
        let o: OuterOpt = OuterOpt {
            inner: InnerOpt { a: null }
        };
        // Attempting to access optional 'a' requires non-null assertion
        // This should trigger a runtime exception if accessed, so we check instead:
        if (o.inner.a == null) {
            dump(0);
        } else {
            dump(o.inner.a!!);
        }
    }
}

///////////////////////////////////////////////////////////////////////
// Test 5: Complex Deep Nesting (20 levels)
///////////////////////////////////////////////////////////////////////
struct L20 {
    value: Int
}

struct L19 {
    l20: L20
}

struct L18 {
    l19: L19
}

struct L17 {
    l18: L18
}

struct L16 {
    l17: L17
}

struct L15 {
    l16: L16
}

struct L14 {
    l15: L15
}

struct L13 {
    l14: L14
}

struct L12 {
    l13: L13
}

struct L11 {
    l12: L12
}

struct L10 {
    l11: L11
}

struct L9 {
    l10: L10
}

struct L8 {
    l9: L9
}

struct L7 {
    l8: L8
}

struct L6 {
    l7: L7
}

struct L5_2 {
    l6: L6
}

struct L4_2 {
    l5: L5_2
}

struct L3_2 {
    l4: L4_2
}

struct L2_2 {
    l3: L3_2
}

struct L1_2 {
    l2: L2_2
}

contract TestDeepNesting {
    receive() {
        let nested: L1_2 = L1_2 {
            l2: L2_2 {
                l3: L3_2 {
                    l4: L4_2 {
                        l5: L5_2 {
                            l6: L6 {
                                l7: L7 {
                                    l8: L8 {
                                        l9: L9 {
                                            l10: L10 {
                                                l11: L11 {
                                                    l12: L12 {
                                                        l13: L13 {
                                                            l14: L14 {
                                                                l15: L15 {
                                                                    l16: L16 {
                                                                        l17: L17 {
                                                                            l18: L18 {
                                                                                l19: L19 {
                                                                                    l20: L20 { value: 777 }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        dump(nested.l2.l3.l4.l5.l6.l7.l8.l9.l10.l11.l12.l13.l14.l15.l16.l17.l18.l19.l20.value); // Expected: 777
    }
}

///////////////////////////////////////////////////////////////////////
// Test 6: Structs with Defaults
///////////////////////////////////////////////////////////////////////
struct InnerDefault {
    x: Int = 100
}

struct OuterDefault {
    inner: InnerDefault;
    y: Int = 200
}

contract TestStructDefaults {
    receive() {
        // Override default for y
        let o: OuterDefault = OuterDefault {
            inner: InnerDefault{},
            y: 300
        };
        dump(o.inner.x + o.y); // Expected: 400
    }
}
