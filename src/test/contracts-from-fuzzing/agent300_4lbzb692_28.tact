struct Mix {
    id: Int;
    alive: Bool;
    name: String;
    maybeAge: Int?;
    maybeNick: String?;
}

contract Test {
    m: Mix = Mix { id:1, alive:true, name:"x", maybeAge:null, maybeNick:null };
}