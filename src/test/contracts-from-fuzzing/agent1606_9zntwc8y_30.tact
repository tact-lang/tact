contract LargeOptionDefaults {
    i: Int? = null;
    s: String? = null;
    b: Bool? = null;
    x: Int = 0;
    y: Bool = false;

    init() {
        self.i=null;
        self.s=null;
        self.b=null;
        self.x=10;
        self.y=true;
    }

    receive() {
        let _i=self.i;
        let _s=self.s;
        let _b=self.b;
        let _x=self.x;
        let _y=self.y;
    }
}