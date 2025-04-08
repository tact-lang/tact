contract ComboPrimitives {
    a:Int;
    b:Bool;
    c:Address;
    d:Slice;
    e:Cell;
    f:Builder;
    g:String;

    init() {
        self.a=1; self.b=true; self.c=myAddress();
        self.d=emptyCell().asSlice(); self.e=emptyCell();
        self.f=beginCell(); self.g="hi";
    }

    receive(){}
}