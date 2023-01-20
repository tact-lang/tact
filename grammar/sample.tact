import "@stdlib/ownable" /* Some Comment */;
import some invalid import haha;

struct SampleStruct {
    message: Int as uint32;
}

message MyMessage {
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

    get fun hello(arg: Int): Int {
        // Single line comment
        /**
         *Multi line comment 
         */
        return (arg + 10) * 10;
    }
}