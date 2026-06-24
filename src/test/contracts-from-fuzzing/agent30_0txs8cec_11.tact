contract TestAddressKey {
    m: map<Address, Int>;

    receive() {
        self.m = emptyMap();
        let ctx: Context = context();
        self.m.set(ctx.sender, 999);
        let v: Int = self.m.get(ctx.sender)!!;
        dump(v); // Expected to dump 999
    }
}
