struct BigNested {
    nested: Nested;
}

struct Nested {
    nested2: Nested2;
}

struct Nested2 {
    nested3: Nested3;
}

struct Nested3 {
    nested4: Nested4;
}

struct Nested4 {
    nested5: Nested5;
}

struct Nested5 {
    nested6: Nested6;
}

struct Nested6 {
    nested7: Nested7;
}

struct Nested7 {
    nested8: Nested8;
}

struct Nested8 {
    value: Bool;
}

contract NineDeep {
    state: BigNested;

    init() {
        self.state = BigNested{
            nested: Nested{
                nested2: Nested2{
                    nested3: Nested3{
                        nested4: Nested4{
                            nested5: Nested5{
                                nested6: Nested6{
                                    nested7: Nested7{
                                        nested8: Nested8{ value: true }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
