struct TwoOptionals {
    one: Int?;
    two: Int?;
}

contract StaticTwoNulls {
    pair: TwoOptionals = TwoOptionals{one:null,two:null};
}