# Terraform GCP VM and Firewall Setup 🚀

This project demonstrates how to use **Terraform** and **GitHub Actions** to provision infrastructure on **Google Cloud Platform (GCP)**.  
It creates a **Compute Engine Virtual Machine (VM)** and a **firewall rule** to allow incoming traffic.

---

## 📌 Project Overview
- Provisioned a **GCP VM instance** using Terraform.
- Configured a **firewall rule** to allow external access (e.g., SSH/HTTP).
- Managed infrastructure lifecycle using **Infrastructure as Code (IaC)**.
- Automated Terraform workflows using **GitHub Actions CI/CD**.
- Stored Terraform state in a **remote GCS backend** for collaboration.

---

## 🛠️ Tech Stack
- **Terraform** (Infrastructure as Code)
- **GCP** (Compute Engine, VPC Networking, Firewall Rules)
- **GCS** (for remote backend state storage)
- **GitHub Actions** (CI/CD for Terraform)

---

## 📂 Project Structure


---

## ⚙️ How It Works
1. **Provider Setup**  
   - Configures GCP provider with project, region, and zone.  

2. **VM Creation**  
   - Creates a Compute Engine instance with a Debian image.  

3. **Firewall Rule**  
   - Opens port `22` (SSH) and `80` (HTTP).  

4. **State Management**  
   - Stores Terraform state in GCS.  

5. **CI/CD (GitHub Actions)**  
   - Every `push` or `pull request` triggers:
     - `terraform fmt` (format check)  
     - `terraform init` (initialize backend)  
     - `terraform plan` (dry run)  
     - `terraform apply` (only on `main` branch with approval)  

---

## 🚀 Usage

### 1️⃣ Setup GitHub Secrets
In your GitHub repo, go to **Settings → Secrets and variables → Actions** and add:

- `GCP_CREDENTIALS` → Contents of your GCP Service Account JSON key.  
- `GCP_PROJECT_ID` → Your GCP project ID.  
- `GCP_REGION` → (e.g., `us-central1`)  
- `GCP_ZONE` → (e.g., `us-central1-a`)  

---

### 2️⃣ GitHub Actions Workflow
`.github/workflows/terraform.yml`:

### Example Output

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

vm_external_ip = "34.123.45.67"
