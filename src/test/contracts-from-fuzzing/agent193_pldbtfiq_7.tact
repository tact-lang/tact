struct Deep {
    foo: Int;
    bar: Int; 
    baz: Int;
    qux: Int;
    quux: Int;
    corge: Int;
    grault: Int;
    garply: Int;
    waldo: Int;
    fred: Int;
    plugh: Int;
    xyzzy: Int;
    thud: Int;
    alpha: Int;
    beta: Int;
}

contract LongNested {
    deepStruct: Deep;

    init() {
        self.deepStruct = Deep{
            foo:1,bar:2,baz:3,qux:4,quux:5,corge:6,grault:7,garply:8,waldo:9,
            fred:10,plugh:11,xyzzy:12,thud:13,alpha:14,beta:15
        };
    }
}