struct OptIntBool {
    oi: Int?;
    ob: Bool?;
}

contract OptionalBoth {
    d: OptIntBool = OptIntBool{
        oi:null,
        ob:null
    };
    receive() {
        let _ = self.d.ob;
    }
}