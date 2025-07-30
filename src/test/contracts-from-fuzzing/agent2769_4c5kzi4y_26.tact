struct Group {
    i: Int;
    s: String?;
    b: Bool?;
}

contract OptNested {
    g: Group = Group{i:42,s:null,b:true};
}