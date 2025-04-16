struct Holder {
    x: Int;
    y: Bool;
}

contract LargeArrayOfFields {
    f1: Holder;
    f2: Holder;
    f3: Holder;
    f4: Holder;
    f5: Holder;
    f6: Holder;
    f7: Holder;
    f8: Holder;
    f9: Holder;
    f10: Holder;
    init() {
        let h = Holder{x: 1, y: false};
        self.f1=h; self.f2=h; self.f3=h; self.f4=h; self.f5=h;
        self.f6=h; self.f7=h; self.f8=h; self.f9=h; self.f10=h;
    }
}