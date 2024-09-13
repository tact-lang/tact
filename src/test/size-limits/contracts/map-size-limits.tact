//
// map<Int, Int>
//

message AddIntInt {
    batchSize: Int as uint8;
    startingValue: Int as uint16;
}

contract MapIntInt {
    /// Target map
    m: map<Int as uint16, Int as uint16>;

    /// To handle deployment
    receive() {}

    /// To add an item
    receive(msg: AddIntInt) {
        let curVal = msg.startingValue;
        repeat (msg.batchSize) {
            self.m.set(curVal, curVal);
            curVal += 1;
        }
    }
}

//
// map<Int, Bool>
//

message AddIntBool {
    batchSize: Int as uint8;
    startingKey: Int;
}

contract MapIntBool {
    /// Target map
    m: map<Int, Bool>;

    /// To handle deployment
    receive() {}

    /// To add an item
    receive(msg: AddIntBool) {
        let curVal = msg.startingKey;
        repeat (msg.batchSize) {
            self.m.set(curVal, false);
            curVal += 1;
        }
    }
}

//
// map<Int, Cell>
//

message AddIntCell {
    batchSize: Int as uint8;
    startingKey: Int;
}

contract MapIntCell {
    /// Target map
    m: map<Int, Cell>;

    /// To handle deployment
    receive() {}

    /// To add an item
    receive(msg: AddIntCell) {
        let curVal = msg.startingKey;
        repeat (msg.batchSize) {
            self.m.set(curVal, emptyCell());
            curVal += 1;
        }
    }
}

//
// map<Int, Address>
//

message AddIntAddress {
    batchSize: Int as uint8;
    startingKey: Int;
}

contract MapIntAddress {
    /// Target map
    m: map<Int, Address>;

    /// To handle deployment
    receive() {}

    /// To add an item
    receive(msg: AddIntAddress) {
        let curVal = msg.startingKey;
        let myAddr = myAddress(); // TODO: different addresses
        repeat (msg.batchSize) {
            self.m.set(curVal, myAddr);
            curVal += 1;
        }
    }
}

//
// map<Int, Struct>
//

message AddIntStruct {
    batchSize: Int as uint8;
    startingKey: Int;
}

struct BoolBool { yes: Bool }

contract MapIntStruct {
    /// Target map
    m: map<Int, BoolBool>;

    /// To handle deployment
    receive() {}

    /// To add an item
    receive(msg: AddIntStruct) {
        let curVal = msg.startingKey;
        let stBool = BoolBool{ yes: true };
        repeat (msg.batchSize) {
            self.m.set(curVal, stBool);
            curVal += 1;
        }
    }
}

//
// map<Int, Message>
//

message AddIntMessage {
    batchSize: Int as uint8;
    startingKey: Int;
}

message(0x2A) TheAnswer {}

contract MapIntMessage {
    /// Target map
    m: map<Int, TheAnswer>;

    /// To handle deployment
    receive() {}

    /// To add an item
    receive(msg: AddIntMessage) {
        let curVal = msg.startingKey;
        let msgEmpty = TheAnswer{};
        repeat (msg.batchSize) {
            self.m.set(curVal, msgEmpty);
            curVal += 1;
        }
    }
}

// TODO: all the same, but with Addresses as keys.
// NOTE: contractAddress(StateInit{code: emptyCell(), data: beginCell().storeUint(curVal, 16).endCell()})
