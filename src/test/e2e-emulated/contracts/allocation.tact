import "@stdlib/deploy";

message SetCost {
    cost: Int? as coins;
}

struct Struct2 {
    c: String;
    d: String;
    e: String;
    f: String;
}

contract Test with Deployable {
    owner: Address;
    seqno: Int as uint256 = 0;
    a: Int as uint256 = 0;
    b: Int as uint256 = 0;

    struct2: Struct2;

    author3: Address?;

    cost: Int? as coins;
    address: Address?;
    price: Int? as coins;

    init(owner: Address, struct2: Struct2) {
        self.owner = owner;
        self.struct2 = struct2;
    }

    receive(msg: SetCost) {
        self.cost = msg.cost;
        self.reply("Cost is updated".asComment());
    }
}