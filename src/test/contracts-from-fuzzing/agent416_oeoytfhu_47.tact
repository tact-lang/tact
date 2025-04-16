struct Deep {
    one: Int;
    two: Bool;
}

contract Test47 {
    first: Deep = Deep{ one:1,two:true };
    second: Deep = Deep{ one:2,two:false };
    third: Deep = Deep{ one:3,two:true };
    fourth: Deep = Deep{ one:4,two:false };
}