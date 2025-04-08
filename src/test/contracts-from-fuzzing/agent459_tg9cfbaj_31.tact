message(33) MOpt { data: Int }
message(34) MReq { val: Bool }

struct MixMsgOpt {
    mopt: MOpt?;
    mreq: MReq;
}

contract MixMsgsOptReq {
    store: MixMsgOpt = MixMsgOpt{
        mopt: null,
        mreq: MReq{ val:true }
    };

    init() {
        self.store = MixMsgOpt{
            mopt: MOpt{ data:42 },
            mreq: MReq{ val:false }
        };
    }
}