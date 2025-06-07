contract TestMapAddress {
    m: map<Address, Bool> = emptyMap();
    
    init() {
        let ctx: Context = context();
        self.m.set(ctx.sender, true);
    }
    
    receive() {
        let ctx: Context = context();
        let b: Bool = self.m.get(ctx.sender)!!;
        dump(b);
    }
}
