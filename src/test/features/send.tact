import "@stdlib/deploy";

contract SendTester with Deployable {

    init() {
        emit("Deploy success".asComment());
    }

    receive("Hello") {
        self.reply("World".asComment());
        emit("Something".asComment());
    }
}