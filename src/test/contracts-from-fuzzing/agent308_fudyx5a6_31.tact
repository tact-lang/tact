contract InlinePrimitives {
    foo:Int=0; bar:Int=1; baz:Int=2; qux:Int=3; quux:Int=4;
    f:Bool=false; g:Bool=true;
    s1:String="x"; s2:String="y";
    addr:Address; ce:Cell;

    init() {
        self.addr = myAddress();
        self.ce = emptyCell();
    }
}
