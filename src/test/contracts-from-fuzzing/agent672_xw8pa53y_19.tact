// Very deep nesting in combination

struct S1 { val: Int; }
struct S2 { inner: S1; }
struct S3 { inner: S2; }
struct S4 { inner: S3; }
struct S5 { inner: S4; }
struct S6 { inner: S5; }
struct S7 { inner: S6; }
struct S8 { inner: S7; }

contract VeryDeepNestedStruct {
    data: S8;
    init() {
        self.data = S8{ inner: S7{ inner: S6{ inner: S5{ inner: S4{ inner: S3{ inner: S2{ inner: S1{ val: 1 }}}}}}}};
    }
}
