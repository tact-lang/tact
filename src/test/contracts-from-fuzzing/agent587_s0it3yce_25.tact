contract OptionalFieldsOnly {
    p: Int?;
    q: Bool?;
    r: Int?;
    s: Bool?;
    t: Int?;
    init() {
        self.p=null;self.q=null;self.r=null;self.s=null;self.t=null;
    }
    receive() {
        if(self.p!=null){ let _=self.p!!; }
        if(self.q!=null){ let _=self.q!!; }
    }
}