struct HasBoolString {
    f1: Bool;
    f2: String;
}

contract TestContract {
    s: HasBoolString = HasBoolString{ f1:true, f2:"hi" };
}