import "@stdlib/deploy";

contract SendTester with Deployable {

    init() {
        emit("Deploy success".asComment());
    }

    receive("Hello") {
        self.reply("World".asComment());
        emit("Something".asComment());
    }

    /// A no-op receiver for incoming funds
    receive("topup") {}

    /// A getter to get contracts balance
    get fun balance(): Int { return myBalance(); }

    /// Sends a message, keeps the original balance, sends the rest in the next message
    receive("ReserveAtMost_1") {
        emit("Have you seen this message?".asComment());

        nativeReserve(ton("0.05"), ReserveAtMost | ReserveAddOriginalBalance);

        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingBalance,
            body: "I give you my all! Well, all that's not mine!".asComment(),
        });
    }

    /// Sends a message, keeps the original balance, sends the rest in the next message
    receive("ReserveAtMost_2") {
        send(SendParameters{
            to: myAddress(),
            value: 0,
            mode: SendDefaultMode | SendPayGasSeparately,
            body: "topup".asComment(),
        });

        nativeReserve(ton("0.05"), ReserveAtMost | ReserveAddOriginalBalance);

        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingBalance,
            body: "I give almost all that's not mine!".asComment(),
        });
    }
}
