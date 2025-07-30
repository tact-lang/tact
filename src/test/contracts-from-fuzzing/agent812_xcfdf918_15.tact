struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int;
    g: Bool;
    h: String;
    i: Address;
    j: Cell;
}

contract HugeStructField {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1,b:true,c:"c",d:myAddress(),e:emptyCell(),
            f:2,g:false,h:"h",i:myAddress(),j:emptyCell()
        };
    }
}