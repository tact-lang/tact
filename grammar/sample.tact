import "@stdlib/ownable" /* Some Comment */;
import some invalid import haha;

extends fun add(self: Int, b: Int): Int {
    return self * b;
}

struct SampleStruct {
    /** Comment **/
    value1: Int;
    value2: /** Comment **/ Int as uint32;
    value3: Bool = /** Comment **/ true;
}

message /**/ MyMessage {
    data: SampleStruct;
}

message /**/ (0x123) MyMessage2 {
    data: SampleStruct;
}

trait MyTrait {
    fun get extends traitState(): Int {
        return 0;
    }
}

contract MyContract with MyTrait, Ownable {

    owner: Address;

    init(owner: Address) {
        self.owner = owner;
    }

    get fun hello(arg: Int): Int {
        if (arg == 0) {
            return arg + 1000;
        }

        // Single line comment
        /**
         *Multi line comment 
         */
        return (arg + 10) * 10;
    }
}