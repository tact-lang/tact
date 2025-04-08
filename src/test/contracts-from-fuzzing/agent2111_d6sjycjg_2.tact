contract EmptyStructField {
    s: SomeStruct;

    init() {
        self.s = SomeStruct{ val: 7 };
    }
}

struct SomeStruct {
   val: Int;
}