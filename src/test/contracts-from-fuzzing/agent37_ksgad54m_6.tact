message BounceData { info: Int as uint16 }

contract Failer {
    receive() {
        throw(999);
    }
}

contract Sender {
    value: Int = 0;

    bounced(msg: bounced<BounceData>) {
         self.value = msg.info;
    }

    fun sendMsg(target: Address) {
         send(SendParameters{
              bounce: true,
              to: target,
              value: 0,
              body: BounceData{info: 42}.toCell()
         });
    }

    receive() {
         self.reply("OK".asComment());
    }
}
