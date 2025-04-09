struct S { a: Int }

contract LargeStructArray {
    f00: S; f01: S; f02: S; f03: S; f04: S; f05: S; f06: S; f07: S; f08: S; f09: S;
    f10: S; f11: S; f12: S; f13: S; f14: S; f15: S; f16: S; f17: S; f18: S; f19: S;

    init() {
        self.f00 = S{a:0}; self.f01 = S{a:1}; self.f02 = S{a:2}; self.f03 = S{a:3}; self.f04 = S{a:4};
        self.f05 = S{a:5}; self.f06 = S{a:6}; self.f07 = S{a:7}; self.f08 = S{a:8}; self.f09 = S{a:9};
        self.f10 = S{a:10}; self.f11 = S{a:11}; self.f12 = S{a:12}; self.f13 = S{a:13}; self.f14 = S{a:14};
        self.f15 = S{a:15}; self.f16 = S{a:16}; self.f17 = S{a:17}; self.f18 = S{a:18}; self.f19 = S{a:19};
    }
}