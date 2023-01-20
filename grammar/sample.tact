import "@stdlib/ownable" /* Some Comment */;
import some invalid import haha;

struct SampleStruct {
    /** Comment **/
    value1: Int;
    value2: /** Comment **/ Int as uint32;
    value3: Bool = /** Comment **/ true;
}

message MyMessage {
    data: SampleStruct;
}

message /**/ (0x123) MyMessage2 {
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