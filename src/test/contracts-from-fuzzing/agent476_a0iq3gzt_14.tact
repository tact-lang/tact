contract SerialIntFormats {
    a:Int as uint8;
    b:Int as int8;
    c:Int as uint16;
    d:Int as int16;
    e:Int as coins;

    init() {
        self.a=10; self.b=-10; self.c=1000; self.d=-1000; self.e=ton("1");
    }
}
