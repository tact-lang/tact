struct InnerComplex {
    Opt: Int?;
    MapField: map<Int, Int>;
}

struct MiddleComplex {
    Inner: InnerComplex;
    Value: Int;
}

struct OuterComplex {
    Middle: MiddleComplex;
    Extra: Int?;
}

contract TestDeepComplex {
    receive() {
        let instance: OuterComplex = OuterComplex {
            Middle: MiddleComplex {
                Inner: InnerComplex {
                    Opt: 123,
                    MapField: emptyMap()
                },
                Value: 456
            },
            Extra: null
        };
        if (instance.Middle.Inner.Opt != null) {
            dump(instance.Middle.Inner.Opt!!);
        }
    }
}
