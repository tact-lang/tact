import "@stdlib/ownable";

struct SampleStruct {
    message: Int as uint32;
}

message(0x1234) MyMessage {
    data: SampleStruct;
}

trait MyTrait {
    get fun traitState(): Int {
        return 0;
    }
}

contract MyContract with MyTrait, Ownable {

    owner: Address;

    init(owner: Address) {
        self.owner = owner;
    }
}