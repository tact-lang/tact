trait OpCodes {
    const OwnershipAssigned: Int = 0x05138d91;
    const Excesses: Int = 0xd53276db;
    const ReportStaticData: Int = 0x8b771735;
}

trait ExitCodes {
    const IncorrectDeployer: Int = 405;
    const IncorrectIndex: Int = 402;
    const IncorrectAmount: Int = 399;
    const IncorrectIndexes: Int = 403;
    const IncorrectForwardPayload: Int = 708;

    const IncorrectSender: Int = 401;
    const InvalidDestinationWorkchain: Int = 333;
    const InvalidData: Int = 65535; // not handled
    const NotInit: Int = 9;
    const InvalidFees: Int = 402;
}

trait GasConstants{ 
   const minTonsForStorage: Int = 50000000;
}