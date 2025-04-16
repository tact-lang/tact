contract CallInit {
    // An internal function that is called during initialization
    fun initFunc(): String {
        dump("initFunc called");
        return "Initialized";
    }

    // The constructor function that is automatically called during deployment
    init() {
        dump("init() started");
        let status: String = self.initFunc();
        let sb: StringBuilder = beginString();
        sb.append("Status: ");
        sb.append(status);
        dump(sb.toString());
    }
}

fun main() {
    dump("Simulating deployment of CallInit contract...");
    // In on-chain deployment, the init() function would be automatically called, so main() just simulates it.
    dump("Done.");
}
