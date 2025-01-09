struct Position {
    tokenId: Int as uint16 = 1;
    foo: Int?;
}

contract Test {
    receive ("test") {
         let p: Position = Position{ };
         dump(p.tokenId);
    }
}
