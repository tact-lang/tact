struct S {
    x: Int;
}

contract TooManyFields {
    f00: S; f01: S; f02: S; f03: S; f04: S; f05: S; f06: S; f07: S; f08: S; f09: S;
    f10: S; f11: S; f12: S; f13: S; f14: S; f15: S; f16: S; f17: S; f18: S; f19: S;
    f20: S; f21: S; f22: S; f23: S; f24: S; f25: S; f26: S; f27: S; f28: S; f29: S;
    
    init() {
        self.f00 = S{x:0}; self.f01 = S{x:1}; self.f02 = S{x:2}; self.f03 = S{x:3}; self.f04 = S{x:4};
        self.f05 = S{x:5}; self.f06 = S{x:6}; self.f07 = S{x:7}; self.f08 = S{x:8}; self.f09 = S{x:9};
        self.f10 = S{x:10}; self.f11 = S{x:11}; self.f12 = S{x:12}; self.f13 = S{x:13}; self.f14 = S{x:14};
        self.f15 = S{x:15}; self.f16 = S{x:16}; self.f17 = S{x:17}; self.f18 = S{x:18}; self.f19 = S{x:19};
        self.f20 = S{x:20}; self.f21 = S{x:21}; self.f22 = S{x:22}; self.f23 = S{x:23}; self.f24 = S{x:24};
        self.f25 = S{x:25}; self.f26 = S{x:26}; self.f27 = S{x:27}; self.f28 = S{x:28}; self.f29 = S{x:29};
    }
}