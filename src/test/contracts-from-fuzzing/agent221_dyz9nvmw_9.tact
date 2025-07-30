struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Int; }
struct Inner4 { d: Int; }
struct Inner5 { e: Int; }
struct Inner6 { f: Int; }
struct Inner7 { g: Int; }
struct Inner8 { h: Int; }
struct Inner9 { i: Int; }
struct Inner10 { j: Int; }

struct BigStruct {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
    i4: Inner4;
    i5: Inner5;
    i6: Inner6;
    i7: Inner7;
    i8: Inner8;
    i9: Inner9;
    i10: Inner10;
}

contract ManyInnerStructs {
    val: BigStruct;

    init() {
        self.val = BigStruct{
            i1: Inner1{a: 1},
            i2: Inner2{b: 2},
            i3: Inner3{c: 3},
            i4: Inner4{d: 4},
            i5: Inner5{e: 5},
            i6: Inner6{f: 6},
            i7: Inner7{g: 7},
            i8: Inner8{h: 8},
            i9: Inner9{i: 9},
            i10: Inner10{j: 10}
        };
    }
}