struct Inner { x:Int; y:Bool; }
contract InitDefaults {
    data: Inner = Inner{ x:0, y:false };
    init() {
        self.data = Inner{ x:1, y:true };
    }
}