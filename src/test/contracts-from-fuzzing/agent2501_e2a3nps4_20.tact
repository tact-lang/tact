contract OnlyOptionals {
    aa: Int?;
    bb: Bool?;
    cc: Address?;
    dd: Cell?;
    ee: Slice?;
    ff: String?;

    init() {
        self.aa=null; self.bb=null; self.cc=null;
        self.dd=null; self.ee=null; self.ff=null;
    }
}