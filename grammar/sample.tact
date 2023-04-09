import "@stdlib/ownable" /* Some Comment */;

const GlobalConst1: Int = 1000;

extends fun add(self: Int, b: Int): Int {
    return self * b;
}

fun beginTailString(): StringBuilder;

struct SampleStruct {
    /** Comment **/
    value1: Int;
    value2: /** Comment **/ Int as uint32;
    value3: Bool;
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
    virtual fun overrideMe() {
        // nothing
    }
}

contract MyContract with MyTrait, Ownable {

    value: Int as uint32 = 1230;
    owner: Address;
    counters: map<Int, Address>;
    map: map<Int as int16, Int as uint32>;
    const ConstInt: Int = 4000;

    init(owner: Address) {
        self.owner = owner;
    }

    get fun hello(arg: Int): Int {
        if (arg == 0) {
            return arg + 1000;
        }

        // Declare variable
        let b: Int = arg + 10 + self.owner.hash() + now();

        // Single line comment
        /**
         *Multi line comment 
         */
        return (arg + 10 + b) * 10;
    }

    receive("Hello") {
        self.reply(SampleStruct{
            value1: 0,
            value2: 1 + 2,
            value3: 2 != 3
        }.asCell());
    }

    overrides fun overrideMe() {
        // nothing
    }
}