contract ManyFields {
    a:Int;
    b:Bool;
    c:String;
    d:Cell;
    e:Address;

    init() {
        self.a=1;
        self.b=false;
        self.c="hi";
        self.d=emptyCell();
        self.e=myAddress();
    }
}