contract ManyPrim {
    a:Int=1; b:Int=2; c:Int=3;
    d:Bool=true; e:Bool=false;
    f:String="hi"; g:String="bye";
    h:Address; i:Cell;

    init() {
        self.h = myAddress();
        self.i = emptyCell();
    }
}
