struct HasOptionals {
    foo: Int?;
    bar: Bool?;
}

contract TopOptionals {
    aa: HasOptionals;
    bb: HasOptionals;
    cc: HasOptionals;

    init() {
        self.aa = HasOptionals{foo: null, bar: true};
        self.bb = HasOptionals{foo: 42, bar: null};
        self.cc = HasOptionals{foo: null, bar: null};
    }
}