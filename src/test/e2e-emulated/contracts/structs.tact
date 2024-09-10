struct S {
    a: Bool;
    b: Int;
}

struct T {
    a: Int;
    s: S;
}

struct MyStruct1 {
    a: Int;
    b: Int as uint32;
    c: Int?;
}

struct MyStruct2 {
    m: map<Int, Int as uint64>;
    s: MyStruct1?;
}

struct MyStruct3 {
    s: String;
}

const globalConstStruct: MyStruct3 = MyStruct3 { s: "global const struct test" };

message MyMessage1 {
    a: Int;
    s: MyStruct2;
}

struct Coin {
    first: Int as coins;
    second: Int as uint32;
}

struct IntFields {
    i1: Int as int1;
    i2: Int as int2;
    i3: Int as int3;
    i255: Int as int255;
    i256: Int as int256;
    i257: Int as int257;
}

message(0xea01f46a) UintFields {
    u1: Int as uint1;
    u2: Int as uint2;
    u3: Int as uint3;
    u254: Int as uint254;
    u255: Int as uint255;
    u256: Int as uint256;
}

fun directParse(payload: Cell): Coin {
    return Coin.fromCell(payload);
}

struct LongStruct15 {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    x11: Int;
    x12: Int;
    x13: Int;
    x14: Int;
    x15: Int;
}

struct LongStruct16 {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    x11: Int;
    x12: Int;
    x13: Int;
    x14: Int;
    x15: Int;
    x16: Int;
}

struct LongStruct32 {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    x11: Int;
    x12: Int;
    x13: Int;
    x14: Int;
    x15: Int;
    x16: Int;
    x17: Int;
    x18: Int;
    x19: Int;
    x20: Int;
    x21: Int;
    x22: Int;
    x23: Int;
    x24: Int;
    x25: Int;
    x26: Int;
    x27: Int;
    x28: Int;
    x29: Int;
    x30: Int;
    x31: Int;
    x32: Int;
}

struct LongNestedStruct {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    x11: Int;
    x12: Int;
    x13: Int;
    x14: Int;
    x15: Int;
    x16: Int;
    x17: Int;
    x18: Int;
    x19: Int;
    x20: Int;

    s1: LongStruct15;
    s2: LongStruct16;
    s3: LongStruct32;
}

struct LongNestedStructWithOpts {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    x11: Int;
    x12: Int;
    x13: Int;
    x14: Int;
    x15: Int;
    x16: Int;
    x17: Int;
    x18: Int?;
    x19: Int;
    x20: Int;

    s1: LongStruct15?;
    s2: LongStruct16;
    s3: LongStruct32?;
}

struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    start: Point;
    end: Point;
}

struct Location {
    idx: Int;
    line1: Line;
    line2: Line?;
}

struct DoubleNestedStructOpt {
    a: Int;
    s: MyStruct1?;
}

struct TripleNestedStructOpt {
    a: Int;
    s: DoubleNestedStructOpt?;
}

struct LongAndDeepNestedStruct {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    x11: Int;
    x12: Int;
    x13: Int;
    x14: Int;
    x15: Int;
    x16: Int;
    s1: TripleNestedStructOpt;
    s2: TripleNestedStructOpt;
    s3: TripleNestedStructOpt?;
    s4: TripleNestedStructOpt?;
}

contract StructsTester {
    s1: S = S {a: false, b: 21 + 21};
    s2: S;
    t1: T = T {a: 43, s: S {a: true, b: 44}};
    t2: T;
    mapWithLongStructs15: map<Int, LongStruct15> = emptyMap();
    mapWithLongStructs16: map<Int, LongStruct16> = emptyMap();
    mapWithLongStructs32: map<Int, LongStruct32> = emptyMap();
    // let's also test contract fields
    x1: Int = 1;
    x2: Int = 2;
    x3: Int = 3;
    x4: Int = 4;
    x5: Int = 5;
    x6: Int = 6;
    x7: Int = 7;
    x8: Int = 8;
    x9: Int = 9;
    x10: Int = 10;
    x11: Int = 11;
    x12: Int = 12;
    x13: Int = 13;
    x14: Int = 14;
    x15: Int = 15;
    x16: Int = 16;
    x17: Int = 17;
    x18: Int = 18;
    x19: Int = 19;
    x20: Int = 20;

    const contractStructConst: MyStruct3 = MyStruct3 { s: "contract const struct test" };

    init() {
        self.s2 = S {a: false || false, b: 42};
        self.t2 = T {a: 40 + 3, s: S {a: true && true, b: 44 | 4}};
    }

    // Deploy
    receive() { }

    get fun structInitializerTest(): Bool {
        return self.s1.a == self.s2.a && self.s1.b == self.s2.b &&
               self.t1.a == self.t2.a &&
               self.t1.s.a == self.t2.s.a && self.t1.s.b == self.t2.s.b;
    }

    get fun toCell1(s: MyStruct1): Cell {
        return s.toCell();
    }

    get fun toSlice1(s: MyStruct1): Slice {
        return s.toSlice();
    }

    get fun fromCell1(src: Cell): MyStruct1 {
        let s = MyStruct1.fromCell(src);
        return s;
    }

    get fun fromSlice1(src: Slice): MyStruct1 {
        return MyStruct1.fromSlice(src);
    }

    get fun toCell2(s: MyStruct2): Cell {
        return s.toCell();
    }

    get fun fromCell2(src: Cell): MyStruct2 {
        let s: MyStruct2 = MyStruct2.fromCell(src);
        return s;
    }

    get fun fromSlice2(src: Slice): MyStruct2 {
        let s: MyStruct2 = MyStruct2.fromSlice(src);
        return s;
    }

    get fun test1(s1: MyStruct1, s2: MyStruct2): Cell {
        let c: Cell = beginCell().storeRef(s1.toCell()).storeRef(s2.toCell()).endCell();
        let s: Slice = c.beginParse();
        let s1_: MyStruct1 = MyStruct1.fromCell(s.loadRef());
        let s2_: MyStruct2 = MyStruct2.fromSlice(s.loadRef().beginParse());
        return beginCell().storeRef(s1_.toCell()).storeRef(s2_.toCell()).endCell();
    }

    get fun toCellMessage1(m: MyMessage1): Cell {
        return m.toCell();
    }

    get fun fromCellMessage1(src: Cell): MyMessage1 {
        return MyMessage1.fromCell(src);
    }

    get fun fromSliceMessage1(src: Slice): MyMessage1 {
        return MyMessage1.fromSlice(src);
    }

    get fun contractStructConstantImmediate(): MyStruct3 {
        return self.contractStructConst;
    }

    get fun globalConstStructConstantImmediate(): MyStruct3 {
        return globalConstStruct;
    }

    get fun contractStructConstantFieldImmediate(): String {
        return self.contractStructConst.s;
    }

    get fun globalConstStructConstantFieldImmediate(): String {
        return globalConstStruct.s;
    }

    get fun contractStructConstantViaVar(): MyStruct3 {
        let s = self.contractStructConst;
        return s;
    }

    get fun globalConstStructConstantViaVar(): MyStruct3 {
        let s = globalConstStruct;
        return s;
    }

    get fun contractStructConstantFieldViaVar(): String {
        let s = self.contractStructConst.s;
        return s;
    }

    get fun globalConstStructConstantFieldViaVar(): String {
        let s = globalConstStruct.s;
        return s;
    }

    receive("example") {
        let coin = directParse(
            beginCell()
            .storeCoins(42)
            .storeUint(35, 31)
            .endCell()
        );
        dump(coin.first);
        dump(coin.second);
    }

    get fun longStruct15Test(): LongStruct15 {
        let s = LongStruct15 {
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: 6,
            x7: 7,
            x8: 8,
            x9: 9,
            x10: 10,
            x11: 11,
            x12: 12,
            x13: 13,
            x14: 14,
            x15: 15
        };

        s.x1 = 1;
        s.x15 = 15;

        self.mapWithLongStructs15.set(1, s);
        return self.mapWithLongStructs15.get(1)!!;
    }

    get fun longStruct16Test(): LongStruct16 {
        let s = LongStruct16 {
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: 6,
            x7: 7,
            x8: 8,
            x9: 9,
            x10: 10,
            x11: 11,
            x12: 12,
            x13: 13,
            x14: 14,
            x15: 15,
            x16: 16
        };

        s.x1 = 1;
        s.x16 = 16;

        self.mapWithLongStructs16.set(1, s);
        return self.mapWithLongStructs16.get(1)!!;
    }

    get fun longStruct32Test(): LongStruct32 {
        let s = LongStruct32 {
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: 6,
            x7: 7,
            x8: 8,
            x9: 9,
            x10: 10,
            x11: 11,
            x12: 12,
            x13: 13,
            x14: 14,
            x15: 15,
            x16: 16,
            x17: 17,
            x18: 18,
            x19: 19,
            x20: 20,
            x21: 21,
            x22: 22,
            x23: 23,
            x24: 24,
            x25: 25,
            x26: 26,
            x27: 27,
            x28: 28,
            x29: 29,
            x30: 30,
            x31: 31,
            x32: 32
        };

        s.x1 = 1;
        s.x32 = 32;

        self.mapWithLongStructs32.set(1, s);
        return self.mapWithLongStructs32.get(1)!!;
    }

    get fun longNestedStructTest(): LongNestedStruct {
        let s = LongNestedStruct {
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: 6,
            x7: 7,
            x8: 8,
            x9: 9,
            x10: 10,
            x11: 11,
            x12: 12,
            x13: 13,
            x14: 14,
            x15: 15,
            x16: 16,
            x17: 17,
            x18: 18,
            x19: 19,
            x20: 20,
            s1: LongStruct15 {
                x1: 1,
                x2: 2,
                x3: 3,
                x4: 4,
                x5: 5,
                x6: 6,
                x7: 7,
                x8: 8,
                x9: 9,
                x10: 10,
                x11: 11,
                x12: 12,
                x13: 13,
                x14: 14,
                x15: 15
            },
            s2: LongStruct16 {
                x1: 1,
                x2: 2,
                x3: 3,
                x4: 4,
                x5: 5,
                x6: 6,
                x7: 7,
                x8: 8,
                x9: 9,
                x10: 10,
                x11: 11,
                x12: 12,
                x13: 13,
                x14: 14,
                x15: 15,
                x16: 16
            },
            s3: LongStruct32 {
                x1: 1,
                x2: 2,
                x3: 3,
                x4: 4,
                x5: 5,
                x6: 6,
                x7: 7,
                x8: 8,
                x9: 9,
                x10: 10,
                x11: 11,
                x12: 12,
                x13: 13,
                x14: 14,
                x15: 15,
                x16: 16,
                x17: 17,
                x18: 18,
                x19: 19,
                x20: 20,
                x21: 21,
                x22: 22,
                x23: 23,
                x24: 24,
                x25: 25,
                x26: 26,
                x27: 27,
                x28: 28,
                x29: 29,
                x30: 30,
                x31: 31,
                x32: 32
            }
        };

        return s;
    }

    get fun longNestedStructWithOptsTest(): LongNestedStructWithOpts {
        let s = LongNestedStructWithOpts {
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: 6,
            x7: 7,
            x8: 8,
            x9: 9,
            x10: 10,
            x11: 11,
            x12: 12,
            x13: 13,
            x14: 14,
            x15: 15,
            x16: 16,
            x17: 17,
            x18: 18,
            x19: 19,
            x20: 20,
            s1: null,
            s2: LongStruct16 {
                x1: 1,
                x2: 2,
                x3: 3,
                x4: 4,
                x5: 5,
                x6: 6,
                x7: 7,
                x8: 8,
                x9: 9,
                x10: 10,
                x11: 11,
                x12: 12,
                x13: 13,
                x14: 14,
                x15: 15,
                x16: 16
            },
            s3: LongStruct32 {
                x1: 1,
                x2: 2,
                x3: 3,
                x4: 4,
                x5: 5,
                x6: 6,
                x7: 7,
                x8: 8,
                x9: 9,
                x10: 10,
                x11: 11,
                x12: 12,
                x13: 13,
                x14: 14,
                x15: 15,
                x16: 16,
                x17: 17,
                x18: 18,
                x19: 19,
                x20: 20,
                x21: 21,
                x22: 22,
                x23: 23,
                x24: 24,
                x25: 25,
                x26: 26,
                x27: 27,
                x28: 28,
                x29: 29,
                x30: 30,
                x31: 31,
                x32: 32
            }
        };

        return s;
    }

    get fun longContractTest(): Int {
        return self.x1 + self.x2 + self.x3 + self.x4 + self.x5 + self.x6 + self.x7 + self.x8 + self.x9 + self.x10 +
               self.x11 + self.x12 + self.x13 + self.x14 + self.x15 + self.x16 + self.x17 + self.x18 + self.x19 + self.x20;
    }

    // https://github.com/tact-lang/tact/issues/690

    get fun location1(): Location {
        let start: Point = Point{ x: 1, y: 2};
        let end: Point = Point{ x: 3, y: 4};

        return Location {
            idx: 1,
            line1: Line {start: start, end: end},
            line2: null
        }
    }

    get fun location2(): Location {
        let start: Point = Point{ x: 1, y: 2};
        let end: Point = Point{ x: 3, y: 4};

        return Location {
            idx: 2,
            line1: Line {start: start, end: end},
            line2: Line {start: start, end: end}
        }
    }

    get fun tripleNestedStructOpt1(): TripleNestedStructOpt {
        return TripleNestedStructOpt {
            a: 1,
            s: DoubleNestedStructOpt {
                a: 2,
                s: MyStruct1 {
                    a: 3,
                    b: 4,
                    c: 5
                }
            }
        }
    }

    get fun tripleNestedStructOpt2(): TripleNestedStructOpt {
        return TripleNestedStructOpt {
            a: 1,
            s: null
        }
    }

    get fun tripleNestedStructOpt3(): TripleNestedStructOpt {
        return TripleNestedStructOpt {
            a: 1,
            s: DoubleNestedStructOpt {
                a: 2,
                s: null
            }
        }
    }

    get fun longAndDeepNestedStruct1(): LongAndDeepNestedStruct {
        return LongAndDeepNestedStruct {
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: 6,
            x7: 7,
            x8: 8,
            x9: 9,
            x10: 10,
            x11: 11,
            x12: 12,
            x13: 13,
            x14: 14,
            x15: 15,
            x16: 16,
            s1: TripleNestedStructOpt {
                a: 1,
                s: DoubleNestedStructOpt {
                    a: 2,
                    s: MyStruct1 {
                        a: 3,
                        b: 4,
                        c: 5
                    }
                }
            },
            s2: TripleNestedStructOpt {
                a: 6,
                s: DoubleNestedStructOpt {
                    a: 7,
                    s: MyStruct1 {
                        a: 8,
                        b: 9,
                        c: 10
                    }
                }
            },
            s3: null,
            s4: null
        }
    }

    get fun longAndDeepNestedStruct2(): LongAndDeepNestedStruct {
        return LongAndDeepNestedStruct {
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: 6,
            x7: 7,
            x8: 8,
            x9: 9,
            x10: 10,
            x11: 11,
            x12: 12,
            x13: 13,
            x14: 14,
            x15: 15,
            x16: 16,
            s1: TripleNestedStructOpt {
                a: 1,
                s: DoubleNestedStructOpt {
                    a: 2,
                    s: MyStruct1 {
                        a: 3,
                        b: 4,
                        c: 5
                    }
                }
            },
            s2: TripleNestedStructOpt {
                a: 6,
                s: DoubleNestedStructOpt {
                    a: 7,
                    s: MyStruct1 {
                        a: 8,
                        b: 9,
                        c: 10
                    }
                }
            },
            s3: TripleNestedStructOpt {
                a: 11,
                s: DoubleNestedStructOpt {
                    a: 12,
                    s: MyStruct1 {
                        a: 13,
                        b: 14,
                        c: 15
                    }
                }
            },
            s4: TripleNestedStructOpt {
                a: 16,
                s: DoubleNestedStructOpt {
                    a: 17,
                    s: MyStruct1 {
                        a: 18,
                        b: 19,
                        c: 20
                    }
                }
            }
        }
    }

    get fun longAndDeepNestedStruct3(): LongAndDeepNestedStruct {
        return LongAndDeepNestedStruct {
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: 6,
            x7: 7,
            x8: 8,
            x9: 9,
            x10: 10,
            x11: 11,
            x12: 12,
            x13: 13,
            x14: 14,
            x15: 15,
            x16: 16,
            s1: TripleNestedStructOpt {
                a: 1,
                s: DoubleNestedStructOpt {
                    a: 2,
                    s: MyStruct1 {
                        a: 3,
                        b: 4,
                        c: 5
                    }
                }
            },
            s2: TripleNestedStructOpt {
                a: 6,
                s: DoubleNestedStructOpt {
                    a: 7,
                    s: MyStruct1 {
                        a: 8,
                        b: 9,
                        c: 10
                    }
                }
            },
            s3: null,
            s4: TripleNestedStructOpt {
                a: 16,
                s: DoubleNestedStructOpt {
                    a: 17,
                    s: MyStruct1 {
                        a: 18,
                        b: 19,
                        c: 20
                    }
                }
            }
        }
    }

    get fun intFieldsStruct(): IntFields {
        return IntFields{
            i1: -1,
            i2: -2,
            i3: -4,
            i255: -pow(2, 254),
            i256: -pow(2, 255),
            i257: -pow(2, 255) - pow(2, 255),
        };
    }

    get fun intFieldsFromCell(src: Cell): IntFields {
        return IntFields.fromCell(src);
    }

    get fun uintFieldsMessage(): UintFields {
        return UintFields{
            u1: 1,
            u2: 3,
            u3: 7,
            u254: pow(2, 254) - 1,
            u255: pow(2, 255) - 1,
            u256: pow(2, 255) - 1 + pow(2, 255),
        };
    }

    get fun uintFieldsFromCell(src: Cell): UintFields {
        return UintFields.fromCell(src);
    }
}
