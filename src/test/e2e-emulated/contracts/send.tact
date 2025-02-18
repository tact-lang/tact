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

    /// Sends a message via emit(),
    /// keeps the original balance,
    /// then sends the rest in the next message via send()
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

    /// Sends a message to our "topup" receiver via send(),
    /// keeps the original balance,
    /// then sends the rest in the next message via send()
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
