import { Address, Cell, ContractProvider, Sender } from "@ton/core";

declare module "../output/Jetton_JettonMinter" {
    interface JettonMinter {
        getTotalSupply(provider: ContractProvider): Promise<bigint>;
        getWalletAddress(
            provider: ContractProvider,
            owner: Address,
        ): Promise<Address>;
        getAdminAddress(provider: ContractProvider): Promise<Address>;
        getContent(provider: ContractProvider): Promise<unknown>;
        sendMint(
            provider: ContractProvider,
            via: Sender,
            to: Address,
            jetton_amount: bigint,
            forward_ton_amount: bigint,
            total_ton_amount: bigint,
        ): Promise<void>;
        sendChangeAdmin(
            provider: ContractProvider,
            via: Sender,
            newOwner: Address,
        ): Promise<void>;
        sendChangeContent(
            provider: ContractProvider,
            via: Sender,
            content: Cell,
        ): Promise<void>;
        sendDiscovery(
            provider: ContractProvider,
            via: Sender,
            address: Address,
            includeAddress: boolean,
            value?: bigint,
        ): Promise<void>;
    }
}
