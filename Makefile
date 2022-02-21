PLAYBOOK_DIR := playbooks
VAR_FILE := vars_master.yml

help:
	@echo "heeelp :))"

#contaienrd deployment
deploy_containerd:
	cd ansible ; ansible-playbook -i inventory --tags "containerd_deploy" $(PLAYBOOK_DIR)/containerd_deploy.yml --extra-vars="ansible_root_path=${PWD}/ansible/vars_master.yml"

configure_containerd:
	cd ansible ; ansible-playbook -i inventory --tags "containerd_config" $(PLAYBOOK_DIR)/containerd_deploy.yml --extra-vars=$(VAR_FILE)

configure_k8s_master:
	cd ansible ; ansible-playbook -i inventory --tags "k8s_master_config" $(PLAYBOOK_DIR)/configure_k8s_master.yml --extra-vars=$(VAR_FILE)

configure_k8s_worker:
	cd ansible ; ansible-playbook -i inventory --tags "k8s_worker_config" $(PLAYBOOK_DIR)/configure_k8s_worker.yml --extra-vars=$(VAR_FILE)

configure_k8s_nodes:
	cd ansible ; ansible-playbook -i inventory --tags "k8s_nodes_config" $(PLAYBOOK_DIR)/configure_k8s_nodes.yml --extra-vars=$(VAR_FILE)
